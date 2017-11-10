#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>

class MyClass : public QObject
{
	Q_OBJECT

private:
	MyClass(QObject* parent);
	static MyClass* createInstance();

public:
	~MyClass();
	static MyClass* instance();
};

#endif // MYCLASS_H
