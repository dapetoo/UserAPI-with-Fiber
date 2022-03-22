package routes

import (
	"fiber-mongo-api/controllers"

	"github.com/gofiber/fiber/v2"
)

func UserRoute(app *fiber.App) {
	app.Get("/", controllers.BaseEndpoint)
	//Endpoint to create user
	app.Post("/user", controllers.CreateUser)

	//Endpoint to get a user by ID
	app.Get("/user/:userId", controllers.GetAUser)

	//Endpoint to edit a user
	app.Put("/user/:userId", controllers.EditAUser)

	//Endpoint to delete a user by its ID
	app.Delete("/user/:userId", controllers.DeleteAUser)

	//
	app.Get("/users", controllers.GetAllUsers)

}
