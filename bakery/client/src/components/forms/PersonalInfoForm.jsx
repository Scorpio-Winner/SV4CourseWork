import React, { useState } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import { TextField, Button } from '@material-ui/core';
import { registerUser } from "../api/authApi";
import { useNavigate } from "react-router-dom";
import logo from "./img/logo.png";
import back from "./img/back.png";

const useStyles = makeStyles((theme) => ({
  formContainer: {
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    height: '100vh',
    width: '100vw',
    backgroundImage: `url(${back})`,
    backgroundSize: 'cover',
  },
  form: {
    backgroundColor: '#F8F8F8',
    padding: '2rem',
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    boxShadow: '0 0 10px rgba(0, 0, 0, 0.2)',
    borderRadius: '10px',

  },
  logo: {
    marginBottom: '2rem',
    width: '206px',
    height: '167px',
    backgroundImage: `url(${logo})`,
    backgroundSize: 'cover',
  },
  input: {
    marginBottom: '1rem',
  },
  button: {
    width:'60%',
    backgroundColor: '#FED84C',
    color: 'white',
    borderRadius: '7px',
    '&:hover': {
      backgroundColor: '#FED84C',
    },
  },
  registerLink: {
    marginTop: '10px',
    display: 'inline-block',
    padding: '0.5rem 1rem',
    backgroundColor: '#CCCCCC',
    color: '#000000',
    borderRadius: '7px',
    textDecoration: 'none',
    border: '1px solid #000000',
    '&:hover': {
      textDecoration: 'none',
    },
  },
}));

const PersonalInfoForm = () => {
  const classes = useStyles();
  const navigate = useNavigate();
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [phone, setPhone] = useState('');
  const [birthdate, setBirthdate] = useState('');

  const handleRegister = (e) => {
    e.preventDefault();

    // Validate firstName, lastName, phone, and birthdate
    if (!firstName || !lastName || !phone || !birthdate) {
      // Handle empty fields
      return;
    }

    const errorHandler = (errorMessage) => {
      // Handle the error, e.g., show an error message to the user
      console.error(errorMessage);
    };

    const userData = {
      firstName,
      lastName,
      phone,
      birthdate,
    };

    registerUser(userData)
      .then((response) => {
        if (!response) {
          errorHandler("Сервис временно недоступен");
          return;
        }

        if (response.status >= 300) {
          errorHandler("Ошибка при создании пользователя. Код: " + response.status);
          return;
        }

        navigate("/login");
      })
      .catch((error) => {
        console.log("Error while registering user:", error);
        // Handle error
      });
  };

  return (
    <div className={classes.formContainer}>
      <form className={classes.form} onSubmit={handleRegister}>
        <div className={classes.logo} />
        <TextField
          className={classes.input}
          label="First Name"
          variant="outlined"
          value={firstName}
          onChange={(e) => setFirstName(e.target.value)}
        />
        <TextField
          className={classes.input}
          label="Last Name"
          variant="outlined"
          value={lastName}
          onChange={(e) => setLastName(e.target.value)}
        />
        <TextField
          className={classes.input}
          label="Phone"
          variant="outlined"
          value={phone}
          onChange={(e) => setPhone(e.target.value)}
        />
        <TextField
          className={classes.input}
          label="Birthdate"
          type="date"
          variant="outlined"
          value={birthdate}
          onChange={(e) => setBirthdate(e.target.value)}
          InputLabelProps={{
            shrink: true,
          }}
        />
        <Button
          className={classes.button}
          variant="contained"
          type="submit"
        >
          Register
        </Button>
      </form>
    </div>
  );
};

export default PersonalInfoForm;