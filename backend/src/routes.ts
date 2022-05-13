import { Router } from "express";
const router = Router();

import { CreateUserController } from "./controllers/CreateUserController";

const UserModel = new CreateUserController()

router.post("/api/user/add", UserModel.handle);

export {router};