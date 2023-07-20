import os
import pathlib
os.chdir(pathlib.Path(__file__).parent.absolute())
path = pathlib.Path(__file__).parent.absolute()
def files(path):
    for file in os.listdir(path):
        if os.path.isfile(os.path.join(path, file)):
            yield file

if __name__ == '__main__':
    delete = ['log','aux','dvi','lof','lot','toc','blg','glg','glo','gls','ist','maf','bak','brf','sav','bbl','out','.gz','pdf']
    for d in delete:
        for f in files(path):
            if(f[-3:] == d):
                os.remove(f)
