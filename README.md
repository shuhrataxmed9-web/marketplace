# Marketplace Platform

Production-ready multi-vendor marketplace monorepo.

## Structure

```
marketplace/
├── frontend/     Next.js 15 App Router
├── backend/      Express + Prisma + Socket.IO
├── shared/       Shared types and validation
├── docker/       Dockerfiles
├── nginx/        Reverse proxy config
└── docs/         Deployment guides
```

## Quick Start

### Prerequisites

- Node.js 20+
- PostgreSQL 16+
- Redis 7+

### Local Development

```bash
cd marketplace
npm install

# Copy environment files
cp .env.example backend/.env
cp frontend/.env.example frontend/.env.local

# Start PostgreSQL and Redis (or use Docker)
npm run docker:up

# Setup database
npm run db:push
npm run db:seed

# Start dev servers
npm run dev
```

- Frontend: http://localhost:3000
- Backend API: http://localhost:4000/api/v1
- Swagger: http://localhost:4000/api/docs

### Seed Accounts

| Role   | Email                  | Password   |
|--------|------------------------|------------|
| Admin  | admin@marketplace.uz   | Admin123!  |
| Buyer  | buyer@marketplace.uz   | Buyer123!  |
| Seller | seller@marketplace.uz  | Seller123! |

## Scripts

| Command | Description |
|---------|-------------|
| `npm run dev` | Start frontend + backend |
| `npm run build` | Build all packages |
| `npm run typecheck` | TypeScript check |
| `npm run db:migrate` | Run Prisma migrations |
| `npm run db:seed` | Seed database |
| `npm run docker:up` | Start Docker services |

## Documentation

- [Free Tier Deploy (Vercel + Render + Neon)](docs/FREE_TIER_DEPLOYMENT.md)
- [Local Development](docs/LOCAL_DEVELOPMENT.md)
- [Docker Deployment](docs/DOCKER_DEPLOYMENT.md)
- [VPS Deployment](docs/VPS_DEPLOYMENT.md)
- [Vercel Deployment](docs/VERCEL_DEPLOYMENT.md)
