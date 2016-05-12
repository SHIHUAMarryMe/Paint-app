#include "choseCAndF.h"

choseCAndF::choseCAndF(QObject* parent=0)
    :QObject(parent),
      fontSize(int(2)),
      currentColor(Qt::black),
      currentAlgorithm(black)
{
    //构造函数.
}
choseCAndF::choseCAndF()
{
    //构造.
}

choseCAndF::~choseCAndF()
{
    //析构
}

int choseCAndF::size()const
{
    return fontSize;
}

QColor choseCAndF::color()const
{
    return currentColor;
}

void choseCAndF::setSize(const int& numberForSize)
{
    fontSize=numberForSize;
    emit sizeChanged(fontSize);
}

void choseCAndF::setColor(const QColor& colorForWrite)
{
    currentColor=colorForWrite;
    emit colorChanged(currentColor);
}

choseCAndF::colorAlgorithm choseCAndF::algorithm()const
{
    return currentAlgorithm;
}

choseCAndF& choseCAndF::setAlgorithm(const colorAlgorithm& color)
{
    currentAlgorithm=color;
    return *this;
}

QColor choseCAndF::choseColor(const colorAlgorithm& color,const int& index)
{
    setAlgorithm(color);
    switch( this->algorithm()+index){
    case black:
        currentColor=Qt::black;
        break;
    case red:
        currentColor=Qt::red;
        break;
    case yellow:
        currentColor=Qt::yellow;
        break;
    case blue:
        currentColor=Qt::blue;
        break;
    case green:
        currentColor=Qt::green;
        break;
    case cyan:
        currentColor=Qt::cyan;
        break;
    }
    emit colorChanged(currentColor);
    return currentColor;
}

QVariant choseCAndF::saveCanvas(const QVariant& dataUrl,const QVariant& savePath)
{
    QImage canvasImage;
    canvasImage.loadFromData(QByteArray::fromBase64(dataUrl.toString().split(",").at(1).toLatin1()), "png");
    QDate currentT=QDate::currentDate();
    QTime currentTm=QTime::currentTime();
    QString nameForPic;
    nameForPic=savePath.toString()+QString("%1%2%3%4%5%6").arg(currentT.year())
                                                          .arg(currentT.month())
                                                          .arg(currentT.day())
                                                          .arg(currentTm.hour())
                                                          .arg(currentTm.minute())
                                                          .arg(currentTm.second())+QString(".png");
    canvasImage.save(nameForPic);
    return QVariant(nameForPic);
}
