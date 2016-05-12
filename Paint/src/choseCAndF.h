#ifndef CHOSECANDF_H
#define CHOSECANDF_H

#include <QColor>
#include <QtGui>

class choseCAndF:public QObject{
    Q_OBJECT
    Q_PROPERTY(int size READ size WRITE setSize NOTIFY sizeChanged)
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_ENUMS (colorAlgorithm)
public:
    enum colorAlgorithm{
        black=0,
        red,
        yellow,
        blue,
        green,
        cyan
    };
    choseCAndF(QObject* parent);
    choseCAndF();
    ~choseCAndF();
    QColor color()const;
    int size()const;
    void setColor(const QColor& colorForWrite);
    void setSize(const int& numberForSize);
    Q_INVOKABLE colorAlgorithm algorithm()const;
    Q_INVOKABLE choseCAndF& setAlgorithm(const colorAlgorithm& color);
    Q_INVOKABLE QColor choseColor(const colorAlgorithm& color,const int& index);
    Q_INVOKABLE QVariant saveCanvas(const QVariant& dataUrl,const QVariant& savePath);
private:
    int fontSize;
    QColor currentColor;
    colorAlgorithm currentAlgorithm;

signals:
    void sizeChanged(const int& size);
    void colorChanged(const QColor& color);

};

#endif // CHOSECANDF_H
