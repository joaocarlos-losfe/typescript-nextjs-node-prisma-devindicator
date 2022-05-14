import { Router } from "express";
const router = Router();

import { CreateUserController } from "./controllers/CreateUserController";

const UserController = new CreateUserController()

router.post("/api/user/add", UserController.handle);

export {router};