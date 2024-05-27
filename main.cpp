#include <QGuiApplication>

#include <QskWindow.h>
#include <QskTextLabel.h>

int main( int argc, char* argv[] )
{
    QGuiApplication app( argc, argv );

    QskWindow window;

    QskTextLabel l("HELLO QSKINNY!");
    window.addItem(&l);

    window.show();
    
    return app.exec();
}