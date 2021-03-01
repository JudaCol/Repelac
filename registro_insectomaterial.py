from PyQt5 import QtCore, QtGui, QtWidgets, uic
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
import MySQLdb as mdb
import sys
import opciones_insectomaterial


class Ui_RegisterWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super(Ui_RegisterWindow, self).__init__()  # Call the inherited classes __init__ method
        uic.loadUi('registro_insectomaterial.ui', self)
        self.show()
        self.redefineWindow()
        self.boton_acciones()
        self.combollenado()
        self.insecto = ""
        self.material = ""
        self.tipomaterial = ""
        self.tipo_cambio()
        self.check_boxes()
        self.pprotect = ""
        self.prepelen = ""
        self.planding = ""
        self.pbitting = ""
        self.pconcentracion = ""
        self.ttest = ""
        self.narticulo = ""
        self.logp = ""
        self.logs = ""


    def redefineWindow(self):
        self.setFixedSize(824, 510)
        self.setWindowIcon(QtGui.QIcon('logo.png'))

    def boton_acciones(self):
        self.commandLinkButton.clicked.connect(self.agregar)
        self.pushButton.clicked.connect(self.atras)
        self.comboBox_4.currentIndexChanged.connect(self.tipo_cambio)

    def check_boxes(self):
        self.checkBox.stateChanged.connect(self.unable_spin)
        self.checkBox_2.stateChanged.connect(self.unable_doublespin)
        self.checkBox_3.stateChanged.connect(self.unable_doublespin_2)
        self.checkBox_4.stateChanged.connect(self.unable_doublespin_3)
        self.checkBox_5.stateChanged.connect(self.unable_doublespin_5)
        self.checkBox_8.stateChanged.connect(self.unable_doublespin_6)
        self.checkBox_6.stateChanged.connect(self.unable_doublespin_7)
        self.checkBox_7.stateChanged.connect(self.unable_doublespin_4)

    def unable_spin(self):
        valor = self.checkBox.checkState()
        if valor == 2:
            self.spinBox.setDisabled(True)
            self.pprotect = None
        else:
            self.spinBox.setDisabled(False)
            self.pprotect = ""

    def unable_doublespin(self):
        valor = self.checkBox_2.checkState()
        if valor == 2:
            self.doubleSpinBox.setDisabled(True)
            self.prepelen = None
        else:
            self.doubleSpinBox.setDisabled(False)
            self.prepelen = ""

    def unable_doublespin_2(self):
        valor = self.checkBox_3.checkState()
        if valor == 2:
            self.doubleSpinBox_2.setDisabled(True)
            self.planding = None
        else:
            self.doubleSpinBox_2.setDisabled(False)
            self.planding = ""

    def unable_doublespin_3(self):
        valor = self.checkBox_4.checkState()
        if valor == 2:
            self.doubleSpinBox_3.setDisabled(True)
            self.pbitting = None
        else:
            self.doubleSpinBox_3.setDisabled(False)
            self.pbitting = ""

    def unable_doublespin_5(self):
        valor = self.checkBox_5.checkState()
        if valor == 2:
            self.doubleSpinBox_5.setDisabled(True)
            self.pconcentracion = None
        else:
            self.doubleSpinBox_5.setDisabled(False)
            self.pconcentracion = ""

    def unable_doublespin_6(self):
        valor = self.checkBox_8.checkState()
        if valor == 2:
            self.doubleSpinBox_6.setDisabled(True)
            self.ttest = None
        else:
            self.doubleSpinBox_6.setDisabled(False)
            self.ttest = ""

    def unable_doublespin_7(self):
        valor = self.checkBox_6.checkState()
        if valor == 2:
            self.doubleSpinBox_7.setDisabled(True)
            self.logp = None
        else:
            self.doubleSpinBox_7.setDisabled(False)
            self.logp = ""

    def unable_doublespin_4(self):
        valor = self.checkBox_7.checkState()
        if valor == 2:
            self.doubleSpinBox_4.setDisabled(True)
            self.logs = None
        else:
            self.doubleSpinBox_4.setDisabled(False)
            self.logs = ""

    def tipo_cambio(self):
        tipomaterial = int(self.comboBox_4.currentIndex()+1)
        if tipomaterial == 1:
            self.doubleSpinBox_7.setDisabled(True)
            self.doubleSpinBox_4.setDisabled(True)
            self.checkBox_7.setEnabled(False)
            self.checkBox_6.setEnabled(False)
        elif tipomaterial == 2:
            self.doubleSpinBox_7.setDisabled(False)
            self.doubleSpinBox_4.setDisabled(False)
            self.checkBox_7.setEnabled(True)
            self.checkBox_6.setEnabled(True)

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
        con4 = mdb.connect('localhost', 'root', '', 'quimica')
        with con4:
            cur4 = con4.cursor()
            try:
                query4 = "SELECT tipo FROM t_tipocompuesto"
                data4 = cur4.execute(query4)
                rows4 = cur4.fetchall()
                for row4 in rows4:
                    self.comboBox_4.addItem(row4[0])
            except Exception as e:
                print(e)
            finally:
                ""

    def atras(self):
        self.close()
        self.ui = opciones_insectomaterial.Ui_MainWindow()

    def agregar(self):
        con = mdb.connect('localhost', 'root', '', 'quimica')
        with con:
            cur = con.cursor()
            self.insecto = int(self.comboBox.currentIndex()+1)
            self.material = int(self.comboBox_2.currentIndex()+1)
            self.tipomaterial = int(self.comboBox_4.currentIndex()+1)
            if self.pprotect is None:
                pass
            else:
                self.pprotect = self.spinBox.value()
            if self.prepelen is None:
                pass
            else:
                self.prepelen = self.doubleSpinBox.value()
            if self.planding is None:
                pass
            else:
                self.planding = self.doubleSpinBox_2.value()
            if self.pbitting is None:
                pass
            else:
                self.pbitting = self.doubleSpinBox_3.value()
            if self.pconcentracion is None:
                pass
            else:
                self.pconcentracion = self.doubleSpinBox_5.value()
            if self.ttest is None:
                pass
            else:
                self.ttest = self.doubleSpinBox_6.value()
            if self.narticulo is None:
                pass
            else:
                self.narticulo = self.comboBox_3.currentText()
            if self.tipomaterial == 1:
                self.logp = None
                self.logs = None
            elif self.tipomaterial == 2:
                self.logp = self.doubleSpinBox_7.value()
                self.logs = self.doubleSpinBox_4.value()
            try:
                sql = 'INSERT INTO t_insectoscompuestos(id_insecto, id_compuesto, perioprotec, porcerepele, porcentlanding, porcentbiting, porceconcetracion, tiempotest, logp, logs, nombre_articulo)' \
                        'VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
                # print(sql)
                alo = cur.execute(sql, (self.insecto, self.material, self.pprotect, self.prepelen, self.planding, self.pbitting, self.pconcentracion, self.ttest, self.logp, self.logs, self.narticulo))
                con.commit()
                if alo:
                    QMessageBox.about(self, 'Inserción', 'Datos Insertados Correctamente')
                else:
                    print('F')
            except Exception as e:
                print(e)
            finally:
                pass
                self.close()
                self.ui = opciones_insectomaterial.Ui_MainWindow()


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    ui = Ui_RegisterWindow()
    app.exec_()
