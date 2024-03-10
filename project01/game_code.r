##**Game: Hammer Scissors Paper ❤**
##Greeting

game <- function() {
	print("Welcome to the game")
    flush.console()
    username <- readline("What's your name?: ")
    print(paste("Let's play game", username))
    print("You have hammer, scissors and paper. Choose one at a time!")

##setting
    continue <- TRUE
    retry <- TRUE
    hands <- c("hammer", "scissors", "paper")
    retry_ans <- c("Y","N")
    comp_score <- 0
    user_score <- 0

##loop
    while(continue) {
        flush.console()
        comp_hand <- sample(hands,1)
        user_hand <- readline("Choose your hand:")
        print(paste("You chose", user_hand,"Comp chose", comp_hand))

##game rules
        if (comp_hand == user_hand) {
          print("Draw")
        } else if (comp_hand == "hammer" & user_hand == "paper") {
          print("You win")
          user_score <-  user_score + 1
        } else if (comp_hand == "scissors" & user_hand == "hammer") {
          print("You win")
          user_score <- user_score + 1
        } else if (comp_hand == "paper" & user_hand == "scissors") {
          print("You win")
          user_score <- user_score + 1
        } else {
		  comp_score <- comp_score + 1
          print("You lose")
        }
##Scoreboard
        print(paste("Comp score", comp_score, "Your score", user_score))

## Winner of the game
        if(user_score > 1 & comp_score <= 1){
          print("Congrats! you've won this game.")
          continue <- FALSE
        } else if(comp_score > 1 & user_score <= 1) {
          print("You lose, let's try again!")
          continue <- FALSE
        break
        }
    }
## Retry
    while(retry) {
        flush.console()
        retry_ans <- readline("Do you want to retry? (Y/N): ")
        if (retry_ans == "Y") {
        game()
        } else if (retry_ans == "N") {
        retry <- FALSE
        print("Good bye!")
        } else {
        retry <- FALSE
        print("Good bye!")
        break
        }
    }
}
