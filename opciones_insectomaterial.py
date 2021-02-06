from PyQt5 import QtCore, QtGui, QtWidgets, uic
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
import MySQLdb as mdb
import registro_insectomaterial
import buscar_insectomaterial
import sys


class Ui_MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super(Ui_MainWindow, self).__init__()  # Call the inherited classes __init__ method
        uic.loadUi('opciones_insectomaterial.ui', self)
        self.show()
        self.redefineWindow()
        self.boton_acciones()

    def redefineWindow(self):
        self.setFixedSize(601, 399)
        self.setWindowIcon(QtGui.QIcon('logo.png'))

    def boton_acciones(self):
        self.pushButton.clicked.connect(self.click_registro)
        self.pushButton_2.clicked.connect(self.click_consultar)
        # self.pushButton_3.clicked.connect(self.historia)
        # self.pushButton_4.clicked.connect(self.actualizar_registro)

    def click_registro(self):
        self.close()
        self.ui = registro_insectomaterial.Ui_RegisterWindow()

    def click_consultar(self):
        self.close()
        self.ui = buscar_insectomaterial.Ui_BuscarWindow()

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    ui = Ui_MainWindow()
    app.exec_()
