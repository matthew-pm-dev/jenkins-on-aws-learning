import fire

# add comment to test jenkins webhook build trigger

def hello(name='World'):
    return "Hello %s!" % name

if __name__ == '__main__':
    fire.Fire(hello)