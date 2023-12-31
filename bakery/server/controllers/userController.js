const { User, Basket } = require("../models/models");
const bcrypt = require("bcrypt");
const fs = require("fs");
const path = require("path");
const { Sequelize, Op, Model, DataTypes, where } = require('sequelize');


class UserController {
  async getAll(req, res) {
    try {
      const users = await User.findAll({
        attributes: { exclude: ["password"] },
      });

      return res.json(users);
    } catch (err) {
      return res.sendStatus(500);
    }
  }

  async getOne(req, res) {
    const { id } = req.params;

    if (isNaN(id)) {
      return res.sendStatus(400);
    }

    try {
      const user = await User.findOne({
        where: { id: id },
        attributes: { exclude: ["password"] },
      });

      if (user == null) {
        return res.sendStatus(404);
      }

      return res.json(user);
    } catch (err) {
      return res.sendStatus(500);
    }
  }

  async getProfile(req, res) {
    const id = req.userId;

    if (isNaN(id)) {
      return res.sendStatus(400);
    }

    try {
      const user = await User.findOne({
        where: { id: id },
        attributes: { exclude: ["password"] },
      });

      if (user == null) {
        return res.sendStatus(404);
      }

      return res.json(user);
    } catch (err) {
      return res.sendStatus(500);
    }
  }


  async update(req, res) {
    const { id } = req.params;

    const user = { ...req.body };

    if (isNaN(id) || parseInt(id) !== user.id) {
      return res.sendStatus(400);
    }

    try {


      const existingUser = await User.findOne({ where: { id: id } });

      if (existingUser == null) {
        return res.sendStatus(404);
      }

      if (user.email !== existingUser.email) {
        if ((await User.findOne({ where: { email: user.email } })) !== null) {
          return res.status(400).json({ error: "Email is taken" });
        }
      }

     // user.password = await bcrypt.hash(user.password, 10);

      await User.update(user, { where: { id: id } });

      return res.sendStatus(204);
    } catch (err) {

      console.log(err);
      return res.sendStatus(500);
    }
  }


  async create(req, res) {
    try {
      const user = { ...req.body };
  
      if (await User.findOne({ where: { email: user.email } })) {
        return res.status(400).json({ error: "Email is taken" });
      }
  
      user.password = await bcrypt.hash(user.password, 10);
  
      const createdUser = await User.create(user);
  
      const basket = await Basket.create({ userId: createdUser.id });
  
      // Обновление пользователя с информацией о корзине
      await createdUser.update({ basketId: basket.id });
  
      return res.status(201).json(createdUser);
    } catch (err) {
      console.error(err);
      return res.sendStatus(500);
    }
  }
  

}

module.exports = new UserController();