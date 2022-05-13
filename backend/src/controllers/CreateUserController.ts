import { Request, Response } from "express";
import { prismaClient } from "../database/prismaClient";

import { hash } from "bcrypt";

export class CreateUserController {
    async handle(req: Request, res: Response) {
      try{

        let { username, email, pass } = req.body;
        pass = await hash(pass, 10);
        
        const user = await prismaClient.user.create({
            data: {
                username,
                email, 
                pass
            },
      });
  
      return res.status(201).json({user, inserted: true});

      }catch(e){
        return res.status(500).json({message: "erro no servidor", inserted: false});
      }
    }
  }