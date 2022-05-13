import express from "express";
import cors from "cors";
require('dotenv').config();

const app = express();

import { router } from "./routes";

app.use(cors({origin: '*'}));
app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.use(router);

app.get('/api/', (req, res)=>{
    
    res.status(200).json({message: "devindicator api", data:{}});
})

const PORT = 5000;

app.listen(PORT, ()=>{console.log(`server is running on port ${PORT}`)});