# Deploying to Render

This guide explains how to deploy MCP Context Forge to Render.

## Prerequisites

1. A Render account
2. This repository with the necessary files:
   - `render.yaml` - Render configuration
   - `Procfile` - Alternative deployment method
   - `.env.render` - Environment variables template

## Deployment Options

### Option 1: Blueprint Deployment (Recommended)

1. Fork this repository to your GitHub account
2. In your Render dashboard, click "New" and select "Blueprint"
3. Connect your GitHub account and select the forked repository
4. Render will automatically detect the `render.yaml` file and set up the services
5. Configure the environment variables as needed
6. Click "Apply" to start the deployment

### Option 2: Manual Deployment

1. In your Render dashboard, click "New" and select "Web Service"
2. Connect your GitHub repository
3. Configure the service:
   - **Name**: Choose a name for your service
   - **Environment**: Python
   - **Region**: Choose the region closest to your users
   - **Branch**: main (or your preferred branch)
   - **Build Command**: `pip install -e .`
   - **Start Command**: `./run-gunicorn.sh`
4. Add environment variables from `.env.render`
5. Click "Create Web Service"

## Environment Variables

Important environment variables to configure:

- `AUTH_ENCRYPTION_SECRET`: Set a secure random string
- `BASIC_AUTH_USER`: Admin username
- `BASIC_AUTH_PASSWORD`: Admin password
- `ALLOWED_ORIGINS`: Add your frontend domains if applicable

### Critical Render-Specific Settings

Render requires that web services bind to host `0.0.0.0` and use the port specified by the `PORT` environment variable (default is `10000`). These settings are already configured in the `.env.production` file:

```
HOST=0.0.0.0
PORT=10000
```

Do not change these values unless you know what you're doing, as they are required for Render to properly route traffic to your application.

## Database Configuration

The default configuration uses SQLite, which is suitable for low-traffic deployments. For production use with higher traffic, consider using a PostgreSQL database:

1. Create a PostgreSQL database in Render
2. Update the `DATABASE_URL` environment variable to point to your PostgreSQL database

## Monitoring and Logs

After deployment:

1. Monitor the build and deployment logs in the Render dashboard
2. Check the application logs for any errors
3. Set up health checks and alerts in the Render dashboard

## Troubleshooting

If you encounter issues:

1. Check the application logs in the Render dashboard
2. Verify that all environment variables are correctly set
3. Ensure the database is properly configured
4. Check that the application is listening on the correct port (Render uses port 10000 by default)

For more help, refer to the [Render documentation](https://render.com/docs) or open an issue in this repository.