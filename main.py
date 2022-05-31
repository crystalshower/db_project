import View.Login as MainMenu
from Tools.Database import connection_test
import logging


def main():
    # Set log level
    logging.basicConfig(level=logging.INFO)

    connection_test()
    MainMenu.login()


if __name__ == "__main__":
    main()
