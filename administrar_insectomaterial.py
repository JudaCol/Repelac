from PyQt5 import QtCore, QtGui, QtWidgets, uic
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
import MySQLdb as mdb
import registro_insectomaterial
import sys
import opciones_insectomaterial
import editar_insectomaterial
import eliminar_insectomaterial


class Ui_AdministrarWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super(Ui_AdministrarWindow, self).__init__()  # Call the inherited classes __init__ method
        uic.loadUi('administrar_insectomaterial.ui', self)
        self.show()
        self.redefineWindow()
        self.combollenado()
        self.boton_acciones()
        self.insecto = ""
        self.material = ""

    def redefineWindow(self):
        self.setFixedSize(630, 385)
        self.setWindowIcon(QtGui.QIcon('logo.png'))

    def boton_acciones(self):
        self.pushButton.clicked.connect(self.atras)
        self.commandLinkButton_3.clicked.connect(self.editar)
        self.commandLinkButton_2.clicked.connect(self.eliminar)

    def atras(self):
        self.close()
        self.ui = opciones_insectomaterial.Ui_MainWindow()

    def combollenado(self):
        con = mdb.connect('localhost', 'root', '', 'quimica')
        self.comboBox.addItem("todos")
        with con:
            cur = con.cursor()
            try:
                query = "SELECT nombre_insecto FROM t_insectos"
                data = cur.execute(query)
                rows = cur.fetchall()
                for row in rows:
                    self.comboBox.addItem(row[0])
            except Exception as e:
                print(e)
            finally:
                ""
        self.comboBox_2.addItem("todos")
        con2 = mdb.connect('localhost', 'root', '', 'quimica')
        with con2:
            cur2 = con2.cursor()
            try:
                query2 = "SELECT nombre_compuesto FROM t_compuestos"
                data2 = cur2.execute(query2)
                rows2 = cur2.fetchall()
                for row2 in rows2:
                    self.comboBox_2.addItem(row2[0])
            except Exception as e:
                print(e)
            finally:
                ""

    def editar(self):
        self.insecto = self.comboBox.currentIndex()
        self.material = self.comboBox_2.currentIndex()
        self.close()
        self.ui = editar_insectomaterial.Ui_EditarWindow(self.insecto, self.material)

    def eliminar(self):
        self.insecto = self.comboBox.currentIndex()
        self.material = self.comboBox_2.currentIndex()
        self.close()
        self.ui = eliminar_insectomaterial.Ui_ListarWindow(self.insecto, self.material)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    ui = Ui_AdministrarWindow()
    app.exec_()