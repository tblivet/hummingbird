import { defineConfig } from 'vite';
import { resolve } from 'path';
import fs from 'fs';
import rtlTransformPlugin from './vite/rtlTransformPlugin';

const dotenv = (await import('dotenv')).default;
if (fs.existsSync('./.env')) dotenv.config({ path: './.env' });

const {
  VITE_PORT = 3000, // Vite dev server port
  HOST = 'localhost', // bind address for Vite
  PS_HOST = 'http://localhost:8887', // PrestaShop origin
  VITE_HOST = 'http://localhost:3000', // public URL of Vite
  PUBLIC_PATH = '/themes/hummingbird/assets/', // where your theme assets live
} = process.env;

export default defineConfig(({ mode }) => {
  const isDev = mode === 'development';

  return {
    root: resolve(__dirname, 'src'),
    base: isDev ? PUBLIC_PATH : './',

    server: isDev ? {
      host: HOST,
      port: VITE_PORT,
      origin: VITE_HOST,

      // ✅ HMR must advertise a hostname the browser can reach
      hmr: {
        host: HOST,
        port: VITE_PORT,
        protocol: 'ws',
        overlay: true,
      },

      // ✅ Serve Vite assets directly, proxy all other requests to PrestaShop
      proxy: {
        '^/(?!themes/hummingbird/assets/|@vite/|@fs/|@id/|node_modules/).*': {
          target: PS_HOST,
          changeOrigin: true,
          secure: false,
        },
      },
    } : undefined,

    build: {
      outDir: resolve(__dirname, 'assets'),
      assetsDir: '',
      emptyOutDir: true,
      rollupOptions: {
        input: {
          script: resolve(__dirname, 'src/js/theme.ts'),
          error: resolve(__dirname, 'src/scss/error.scss'),
          rtl: resolve(__dirname, 'src/scss/rtl.scss'),
          theme: resolve(__dirname, 'src/scss/theme.scss'),
          ...Object.fromEntries(
            fs.readdirSync(resolve(__dirname, 'src/img'))
              .filter(f => /\.(png|jpe?g|svg|gif|tiff|bmp|ico)$/i.test(f))
              .map(f => [`img-${f.split('.')[0]}`, resolve(__dirname, `src/img/${f}`)])
          ),
        },
        output: {
          entryFileNames: (c) => (c.name === 'script' ? 'js/theme.js' : 'js/[name].js'),
          assetFileNames: (a) => {
            const ext = a.name.split('.').pop() || '';
            if (/png|jpe?g|svg|gif|tiff|bmp|ico/i.test(ext)) return 'img/[name][extname]';
            if (/woff2?|eot|ttf|otf/i.test(ext)) return 'fonts/[name]-[hash][extname]';
            if (ext === 'css') return 'css/[name].css';
          }
        }
      }
    },

    css: {
      preprocessorOptions: {
        scss: {
          api: 'modern-compiler',
          silenceDeprecations: ['color-functions', 'global-builtin', 'import'],
        }
      }
    },

    resolve: {
      alias: {
        '@js': resolve(__dirname, 'src/js'),
        '@services': resolve(__dirname, 'src/js/services'),
        '@constants': resolve(__dirname, 'src/js/constants'),
        '@helpers': resolve(__dirname, 'src/js/helpers'),
      }
    },

    plugins: [rtlTransformPlugin()],
  };
});
