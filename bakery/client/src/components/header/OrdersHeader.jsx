import React, { useEffect, useState } from "react";
import { AppBar, Toolbar, IconButton, Box, Button } from "@mui/material";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import PersonIcon from "@mui/icons-material/Person";
import ExitToAppIcon from "@mui/icons-material/ExitToApp";
import InventoryIcon from '@mui/icons-material/Inventory';
import logo from "./logo.png";

const OrdersHeader = () => {
  const handleLogoutClick = () => {
    localStorage.removeItem("jwt");
    localStorage.removeItem("role");
    window.location.reload();
  };
  
  const [scale, setScale] = useState(0.65);

  useEffect(() => {
    const handleResize = () => {
      if (window.innerWidth <= 320) {
        setScale(0.3);
      } else {
        setScale(0.65);
      }
    };

    window.addEventListener("resize", handleResize);
    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, []);

  return (
    <AppBar position="static" style={{ backgroundColor: "#F8F8F8" }}>
      <Toolbar style={{ justifyContent: "center" }}>
        {/* Лого */}
        <div
          style={{
            backgroundImage: `url(${logo})`,
            width: "206px",
            height: "21.5vh",
            backgroundSize: "cover",
            backgroundRepeat: "no-repeat",
            backgroundPosition: "center",
            transform: `scale(${scale})`,
            marginRight: "auto", // Добавлено небольшое расстояние справа от логотипа
          }}
        />


        {/* Текущие заказы */}
        <Button variant="outlined" sx={{ color: "#EF6C00", borderColor: "#EF6C00", textTransform: "none", margin: "0 5vw" }}>
          Текущие заказы
        </Button>

        {/* Завершенные заказы */}
        <Button variant="outlined" sx={{ color: "#EF6C00", borderColor: "#EF6C00", textTransform: "none", margin: "0 2vw" }}>
          Завершенные заказы
        </Button>

        {/* Иконки */}
        <div style={{ marginLeft: "auto" }}>
          {/* Заказы */}
          <IconButton color="inherit">
            <Box
              sx={{
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                width: "40px",
                height: "40px",
                borderRadius: "50%",
                border: "2px solid #000000",
              }}
            >
              <InventoryIcon sx={{ fontSize: 24, color: "#000000" }} />
            </Box>
          </IconButton>

          {/* Корзина */}
          <IconButton color="inherit">
            <Box
              sx={{
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                width: "40px",
                height: "40px",
                borderRadius: "50%",
                border: "2px solid #000000",
              }}
            >
              <ShoppingCartIcon sx={{ fontSize: 24, color: "#000000" }} />
            </Box>
          </IconButton>

          {/* Профиль */}
          <IconButton color="inherit">
            <Box
              sx={{
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                width: "40px",
                height: "40px",
                borderRadius: "50%",
                border: "2px solid #000000",
              }}
            >
              <PersonIcon sx={{ fontSize: 24, color: "#000000" }} />
            </Box>
          </IconButton>

          {/* Кнопка выхода */}
          <IconButton color="inherit" onClick={handleLogoutClick}>
            <Box
              sx={{
                display: "flex",
                alignItems: "center",
                justifyContent: "center",
                width: "40px",
                height: "40px",
                borderRadius: "50%",
                border: "2px solid #000000",
              }}
            >
              <ExitToAppIcon sx={{ fontSize: 24, color: "#000000" }} />
            </Box>
          </IconButton>
        </div>
      </Toolbar>
    </AppBar>
  );
};

export default OrdersHeader;