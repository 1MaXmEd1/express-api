const express = require('express');
const router = express.Router();
const multer = require('multer');
const { UserController } = require('../controllers');

const uploadDestination = 'uploads';

//Показываем где хранить файлы (картинки) так же путь и что файл будет с оригинальным именем
const storage = multer.diskStorage({
  destination: uploadDestination,
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});

const uploads = multer({ storage: storage });

router.post('/register', UserController.register);
router.post('/login', UserController.login);
router.get('/current', UserController.current);
router.get('/users/:id', UserController.getUserById);
router.put('/users/:id', UserController.updateUser);
module.exports = router;
