from bullet import Bullet, colors, YesNo


def bullet_menu(prompt, choices, return_index=False):
    """
    Bullet Menu
    :return:
    """
    choices = Bullet(
        prompt=prompt, choices=choices, word_color=colors.foreground["green"], return_index=return_index
    )
    return choices.launch()


def yesno(prompt):
    """
    YesNo
    :return:
    """
    confirm = YesNo(
        prompt=prompt, word_color=colors.foreground["green"]
    )
    return confirm.launch()
