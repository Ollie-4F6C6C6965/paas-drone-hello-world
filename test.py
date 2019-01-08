import os

def main():
    default_value = "Environment variable doesn't exist."

    print("test.py:main:", os.getenv('TEST_ENV_NOTEXISTS', default_value))
    print("test.py:main:", os.getenv('TEST_ENV_PLAIN', default_value))
    print("test.py:main:", os.getenv('TEST_ENV_ENC', default_value))
    print("test.py:main: TEST_ENV_ENC is as expected:", os.getenv('TEST_ENV_ENC', default_value) == "TestSecret!")

main()
