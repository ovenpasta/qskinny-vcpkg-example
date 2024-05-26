#include <QGuiApplication>

#include <QskWindow.h>
#include <QskTextLabel.h>
#include <iostream>
int main( int argc, char* argv[] )
{
    std::cout << "main" <<std::endl;
    QGuiApplication app( argc, argv );

    std::cout << "started" <<std::endl;
    QskWindow window;
    std::cout << "window" <<std::endl;
    QskTextLabel l("HELLO QSKINNY!");
    window.addItem(&l);
    std::cout << "added" <<std::endl;

    window.show();
    std::cout << "shown" <<std::endl;
    return app.exec();
}