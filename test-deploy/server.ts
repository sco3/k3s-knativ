import express, { Request, Response } from 'express';

const app = express();
const port: number = parseInt(process.env.PORT || '8000');

app.get('/', (_req: Request, res: Response) => {
    res.json({ message: "Hello, World!\n" });
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});