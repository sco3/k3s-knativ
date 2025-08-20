// src/index.ts
import { Elysia } from 'elysia';

const app = new Elysia();

app.get("/", () => "Hello, world!\n");

app.listen(8080);

console.log(
  `Listening ${app.server?.hostname}:${app.server?.port}`
);