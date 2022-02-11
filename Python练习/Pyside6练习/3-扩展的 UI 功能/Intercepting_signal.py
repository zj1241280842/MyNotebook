from PySide6.QtWidgets import (
    QApplication, QMainWindow
)
from PySide6.QtCore import Qt

import sys


class MainWindow(QMainWindow):

    def __init__(self):
        super(MainWindow, self).__init__()
        self.windowTitleChanged.connect(self.on_window_title_changed)
        self.windowTitleChanged.connect(lambda x: self.on_window_title_changed_no_params())
        self.windowTitleChanged.connect(lambda x: self.my_custom_fn())
        self.windowTitleChanged.connect(lambda x: self.my_custom_fn(x, 25))
        self.setWindowTitle("My Signals App")

    def on_window_title_changed(self, s):
        print(s)

    def on_window_title_changed_no_params(self):
        print("Window title changed.")

    def my_custom_fn(self, a="HELLLO!", b=5):
        print(a, b)


app = QApplication(sys.argv)
w = MainWindow()
w.show()
app.exec_()