import random
import subprocess

PHRASES = (
    "IT'S A TRAP!",
    "I AM YOUR FATHER!",
    "MAMMA MIA MARIO",
    "I LOVE DOCKER. Just Kidding",
    "DATA FAILS\nI FIX IT"
)

selected_phrase = random.choice(PHRASES)

subprocess.run(
    ["figlet", "-w", "200", "-f", "starwars", selected_phrase],
    check=True,
)
