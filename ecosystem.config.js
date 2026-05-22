module.exports = {
  apps: [
    {
      name: 'marketplace-api',
      script: 'dist/server.js',
      cwd: './backend',
      instances: 'max',
      exec_mode: 'cluster',
      env: {
        NODE_ENV: 'production',
      },
    },
    {
      name: 'marketplace-web',
      script: 'node_modules/next/dist/bin/next',
      args: 'start',
      cwd: './frontend',
      instances: 1,
      env: {
        NODE_ENV: 'production',
        PORT: 3000,
      },
    },
  ],
};
