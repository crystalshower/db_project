from bullet import Bullet, colors


def bullet_menu(prompt, choices, return_index=False):
    """
    Bullet Menu
    :return:
    """
    choices = Bullet(
        prompt=prompt, choices=choices, word_color=colors.foreground["green"], return_index=return_index
    )
    return choices.launch()
