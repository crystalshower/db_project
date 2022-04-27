import View.MainMenu as MainMenu
import logging


def main():
    # Set log level
    logging.basicConfig(level=logging.WARNING)
    MainMenu.menu_before_login()


if __name__ == '__main__':
    main()
