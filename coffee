menu = {
    "espresso": {
        "ingredients": {
            "water": 50,
            "coffee": 18,
        },
        "cost": 1.5,
    },
    "latte": {
        "ingredients": {
            "water": 200,
            "milk": 150,
            "coffee": 24,
        },
        "cost": 2.5,
    },
    "cappuccino": {
        "ingredients": {
            "water": 250,
            "milk": 100,
            "coffee": 24,
        },
        "cost": 3.0,
    }
}

resources = {
    "water": 500,
    "milk": 300,
    "coffee": 200,
}
profit = 0

money = float(input("How much money do you have? $"))

def print_report():
    """Prints a report of the current resources and profit."""
    print(f"Water: {resources['water']}ml")
    print(f"Milk: {resources['milk']}ml")
    print(f"Coffee: {resources['coffee']}g")
    print(f"Money: ${profit}")


def check_resources(coffee):
    """Checks if there are enough resources to make the selected coffee."""
    for ingredient, amount in coffee["ingredients"].items():
        if resources[ingredient] < amount:
            print(f"Sorry, there is not enough {ingredient}.")
            return False
    return True


def make_coffee(coffee):
    """Subtracts the required ingredients from the resources and adds the cost to the profit."""
    for ingredient, amount in coffee["ingredients"].items():
        resources[ingredient] -= amount
    print(f"Here is your {choice} ☕. Enjoy!")
    global profit
    profit += coffee["cost"]


while True:
    choice = input("What would you like? (espresso/latte/cappuccino): ")
    if choice == "report":
        print_report()
    elif choice == "off":
        break
    else:
        if choice in menu:
            coffee = menu[choice]
            if check_resources(coffee):
                if money >= coffee["cost"]:
                    make_coffee(coffee)
                    money -= coffee["cost"]
                else:
                    print("Sorry, you don't have enough money to buy this coffee.")
        else:
            print("Invalid choice, please try again.")
