#ifndef TEST_H
#define TEST_H

#include <QObject>

#include "PSP_Client/PSP_Device_Information.h"
#include "PSP_Client/PSP_Discovery_Client_Scan.h"

class test : public QObject
{
	Q_OBJECT
private:
	PSP_Discovery_Client_Scan	Discovery;

public:
	explicit test(QObject *parent = nullptr);

signals:

public slots:
	void Deveice(PSP_Device_Information& Dev);

};

#endif // TEST_H
