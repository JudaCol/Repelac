from PyQt5 import QtCore, QtGui, QtWidgets, uic
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
import MySQLdb as mdb
import sys
import opciones_insectomaterial


class Ui_EliminaWindow(QtWidgets.QMainWindow):
    def __init__(self, datas):
        super(Ui_EliminaWindow, self).__init__()  # Call the inherited classes __init__ method
        uic.loadUi('elimina_insectomaterial.ui', self)
        self.show()
        self.redefineWindow()
        self.boton_acciones()
        self.combollenado()
        self.insecto = ""
        self.material = ""
        self.articulo = ""
        self.datas = datas
        # print(datas)
        self.redefineData(datas)

    def redefineData(self, datas):
        self.comboBox.setCurrentText(datas[0])
        self.comboBox_2.setCurrentText(datas[1])
        self.comboBox_3.setCurrentText(datas[6])
        self.spinBox.setValue(float(datas[2]))
        self.doubleSpinBox.setValue(float(datas[3]))
        self.doubleSpinBox_2.setValue(float(datas[4]))
        self.doubleSpinBox_3.setValue(float(datas[5]))
        self.insecto = int(self.comboBox.currentIndex()+1)
        self.material = int(self.comboBox_2.currentIndex()+1)
        self.articulo = self.comboBox_3.currentText()
        self.comboBox.setEnabled(False)
        self.comboBox_2.setEnabled(False)
        self.comboBox_3.setEnabled(False)
        self.spinBox.setEnabled(False)
        self.doubleSpinBox.setEnabled(False)
        self.doubleSpinBox_2.setEnabled(False)
        self.doubleSpinBox_3.setEnabled(False)


    def redefineWindow(self):
        self.setFixedSize(643, 540)
        self.setWindowIcon(QtGui.QIcon('logo.png'))

    def boton_acciones(self):
        self.commandLinkButton.clicked.connect(self.eliminar)
        self.pushButton.clicked.connect(self.atras)

    def combollenado(self):
        con = mdb.connect('localhost', 'root', '', 'quimica')
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
        con3 = mdb.connect('localhost', 'root', '', 'quimica')
        with con3:
            cur3 = con3.cursor()
            try:
                query3 = "SELECT nombre_articulo FROM t_articulos"
                data3 = cur3.execute(query3)
                rows3 = cur3.fetchall()
                for row3 in rows3:
                    self.comboBox_3.addItem(row3[0])
            except Exception as e:
                print(e)
            finally:
                ""

    def atras(self):
        self.close()

    def eliminar(self):
        con = mdb.connect('localhost', 'root', '', 'quimica')
        with con:
            cur = con.cursor()

            try:
                sql = "DELETE FROM t_insectoscompuestos" \
                      " WHERE id_insecto = {} and id_compuesto = {} and nombre_articulo = '{}'".format(self.insecto, self.material, self.articulo)
                print(sql)
                alo = cur.execute(sql)
                con.commit()
                if alo:
                    QMessageBox.about(self, 'Eliminado', 'Datos Eliminados Correctamente')
                else:
                    print('F')
            except Exception as e:
                print(e)
            finally:
                pass
                self.close()


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    ui = Ui_EliminaWindow()
    app.exec_()
