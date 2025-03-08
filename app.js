const express = require('express');
const bodyParser = require('body-parser');
const sendMail = require('./mailer');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

app.post('/send-email', (req, res) => {
  const { email, subject, message } = req.body;

  // Send email to the user who filled out the form
  sendMail(email, subject, message, (err, info) => {
    if (err) {
      return res.status(500).send('Error sending email to user');
    }

    // Send a copy to jdtech.help0@gmail.com
    sendMail(process.env.EMAIL_USERNAME, subject, message, (err, info) => {
      if (err) {
        return res.status(500).send('Error sending email to admin');
      }

      res.status(200).send('Emails sent successfully');
    });
  });
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
