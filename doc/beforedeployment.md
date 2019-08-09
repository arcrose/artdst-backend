# Before deploying artdst

Before deploying artdst to the VPS running the backend server, there are a couple of things
that need to be changed in the codebase for security reasons.

1. Change the value of `privateKeyPath` in `src/local/config.coffee` to the path to the private key for the production server.
2. Change the parameters for the database connection in `src/local/config.coffee`.
3. Run `npm install` from within the `src/` directory to install dependencies.
4. Run `grunt` from within the `src/` directory to check, lint, and test.
