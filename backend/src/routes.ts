import { Router } from "express";
const router = Router();

import { CreateCategoryController } from "./controllers/CreateUserController";

const UserModel = new CreateCategoryController()

router.post("/api/user/add", UserModel.handle);

export {router};