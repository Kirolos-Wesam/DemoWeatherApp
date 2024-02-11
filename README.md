# Demoweatherapp

Welcome to Demo Weather App, Our Application is very simple to show the Data that come from OpenWeather API.

By Using GetX state management, dio, geolocator, clean code and architectural principles, i Could to make an Simple Weather App.

We will see All the ScreenShots about app and i will explain all the project structure and architecture.

First, i followed a MVC architecture pattern and organized the codebase into layers (model, view, controller, services).

# On Board Screen (Show once when you open app first time)

![Screenshot 2024-02-11 185002.png](weatherapp\assets\screenshots\Screenshot 2024-02-11 185002.png)

When you open app first time that show the on board screen and after click (Get Started) you will go next Screen (Home Screen) and save data of you opened app before.

Here I use an get Storage package to save the local data into device, so when open app Again you don't see this screen again.

# Home Screen 

![Screenshot 2024-02-11 185042.png](weatherapp\assets\screenshots\Screenshot 2024-02-11 185042.png)

First, our application requires your permission to access your location and retrieve the weather details for your current location.

So, I used the GeoLocator package to obtain the latitude and longitude of your location.

![Screenshot 2024-02-11 185138.png](weatherapp\assets\screenshots\Screenshot 2024-02-11 185138.png) 

After got your Latitude and Longitude, now this coordinates numbers connect to the OpenWeather Api by Dio Package and get the response data, so that role of the Getx State Management do.

Got the response data and insert into the variable of model to show the data into the user.

The role of the GetX controller is to retrieve the latitude and longitude of your location, send them to the API to fetch the data, and finally, calculate the temperature from Kelvin units to Celsius or Fahrenheit.

If the user wants to know the temperature in Celsius or Fahrenheit, they can click the (°C) button in the app bar. The function in the controller file performs that calculation.

![Screenshot 2024-02-11 192801.png](weatherapp\assets\screenshots\Screenshot 2024-02-11 192801.png)

You can scroll down to refresh the weather, which retrieves your current location and fetches the new weather data.


# Details Screen (Second Screen)

When you click the 'More Details' button below, you will navigate to the next screen (using GetX Route Management) to learn more details about the weather, such as temperature, weather conditions, humidity, wind speed, and an image for each forecast condition.

As shown in the screen above.

![Screenshot 2024-02-11 185218.png](weatherapp\assets\screenshots\Screenshot 2024-02-11 185218.png)


Hope to arrived all the explanation to you.














