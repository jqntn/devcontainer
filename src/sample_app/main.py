import argparse

from sample_app.fizzbuzz import fizzbuzz


def main() -> None:
    parser = argparse.ArgumentParser(prog="sample-app")
    parser.add_argument("n", type=int)
    args = parser.parse_args()
    for line in fizzbuzz(args.n):
        print(line)


if __name__ == "__main__":
    main()
