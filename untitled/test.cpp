#include <QDebug>

#include "test.h"

test::test(QObject *parent) : QObject(parent)
{
	QObject::connect(&Discovery, SIGNAL(On_Response(PSP_Device_Information&)),
					 this, SLOT(Deveice(PSP_Device_Information&)));

	Discovery.Scan(true);
}

void test::Deveice(PSP_Device_Information& Dev)
{
	qDebug() << "Device IP:" << QHostAddress(Dev.getNET_CURRENT_IP());
}
