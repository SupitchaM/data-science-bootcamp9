##Menu book
    df_menu <- data.frame(
        id = 1:4,
        pizza = c("Seafood", "Fourcheese", "Veggie", "Pepporoni"),
        price = c(500, 300, 350, 400)
    )

##Setting
    order <- TRUE
    total_amount <- 0
    order_detail <- list()
    process <- c("Y", "D")

##loop
    chatbot <- function() {
	print("Welcome to Pizza Papaya")
    flush.console()
    username <- readline("What's your name?: ")
    print(paste("Hi",username,"Here's our menu"))
    print(df_menu)

    while(order) {
      process <- readline("Type Y to order or Type D as Done:")
      flush.console()
      if (process == "Y") {
        order <- as.numeric(readline("Please type menu id of pizza: "))
        qty <- as.numeric(readline("How many set?:"))
        item_name <- df_menu[order,2]
        item_amount <- df_menu[order,3] * qty
        total_amount <- total_amount + item_amount
        order_detail[[length(order_detail) + 1]] <- list(
        pizza = item_name,
        quantity = qty,
        amount = item_amount
      )
       } else if (process == "D") {
        order <- FALSE
        print("Here is your order details")
        phone <- readline("Please enter your phone number: ")
        payment <- readline("Please select payment method ('cash' or 'credit card'):")
        print(paste("Your name, phone number, payment :", username, phone, payment))
        print("Order details:")
        for (i in 1:length(order_detail)) {
        complete <- order_detail[[i]]
        print(paste("[",complete$quantity,"set of]", complete$pizza, "[",complete$amount,"THB]"))
        }
        print(paste("Total amount:", total_amount, "THB"))
        print(paste("Free delivery for our lovely customers!"))
        print("Thank you for your support to Pizza Papaya!")
        break
       }
    }
}
