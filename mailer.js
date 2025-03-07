require('dotenv').config();
const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL_USERNAME,
    pass: process.env.EMAIL_PASSWORD,
  },
});

function sendMail(to, subject, text, callback) {
  const mailOptions = {
    from: 'support@yourdomain.com', // Set a default sender email
    to: to,
    subject: subject,
    text: text,
  };

  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      console.log(error);
      callback(error, null);
    } else {
      console.log('Email sent: ' + info.response);
      callback(null, info);
    }
  });
}

module.exports = sendMail;
