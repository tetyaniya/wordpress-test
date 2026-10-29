import { readFileSync, writeFileSync, rmSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { defineConfig, loadEnv } from 'vite';
import basicSsl from '@vitejs/plugin-basic-ssl';

const root = fileURLToPath(new URL('.', import.meta.url));
const marker = new URL('.vite-dev.json', import.meta.url);

// A heartbeat prevents an abandoned marker from enabling dev mode indefinitely.
function wordpressDev(origin) {
  return {
    name: 'ct-wordpress-dev',
    apply: 'serve',
    configureServer(server) {
      let timer;
      const cleanup = () => {
        clearInterval(timer);
        rmSync(marker, { force: true });
      };
      const stop = () => process.exit(0);
      server.httpServer.once('listening', () => {
        const update = () => writeFileSync(marker, JSON.stringify({ url: origin }));
        update();
        timer = setInterval(update, 10000);
        timer.unref();
      });
      process.once('exit', cleanup);
      process.once('SIGINT', stop);
      process.once('SIGTERM', stop);
      server.httpServer.once('close', () => {
        cleanup();
        process.removeListener('exit', cleanup);
        process.removeListener('SIGINT', stop);
        process.removeListener('SIGTERM', stop);
      });
      server.watcher.add(`${root}/**/*.php`);
      server.watcher.on('change', (path) => {
        if (path.endsWith('.php')) server.ws.send({ type: 'full-reload' });
      });
    },
  };
}

export default defineConfig(({ command, mode }) => {
  const env = loadEnv(mode, root, '');
  const origin = env.VITE_DEV_ORIGIN || 'https://localhost:5173';
  const url = new URL(origin);
  const secure = url.protocol === 'https:';
  const hasCertificate = env.VITE_HTTPS_KEY && env.VITE_HTTPS_CERT;
  return {
    root,
    base: command === 'build' ? './' : '/',
    publicDir: false,
    plugins: [
      ...(command === 'serve' && secure && !hasCertificate ? [basicSsl()] : []),
      wordpressDev(origin),
    ],
    server: {
      host: '0.0.0.0',
      port: Number(url.port || (secure ? 443 : 80)),
      strictPort: true,
      origin,
      allowedHosts: [url.hostname],
      cors: { origin: env.WP_ORIGIN || 'https://wordpress-test.ddev.site' },
      https: secure && hasCertificate
        ? { key: readFileSync(env.VITE_HTTPS_KEY), cert: readFileSync(env.VITE_HTTPS_CERT) }
        : undefined,
      hmr: { host: url.hostname, protocol: secure ? 'wss' : 'ws', clientPort: Number(url.port || (secure ? 443 : 80)) },
    },
    build: {
      outDir: 'dist',
      emptyOutDir: true,
      manifest: 'manifest.json',
      rollupOptions: { input: fileURLToPath(new URL('src/ts/main.ts', import.meta.url)) },
    },
  };
});
