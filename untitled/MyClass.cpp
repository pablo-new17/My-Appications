#include <QObject>
#include "Singleton.h"

#include "MyClass.h"

MyClass::MyClass(QObject* parent):
 QObject(parent)
{
}

MyClass* MyClass::createInstance()
{
	return new MyClass();
}

MyClass::~MyClass()
{
}

MyClass* MyClass::instance()
{
	return Singleton<MyClass>::instance(MyClass::createInstance);
}
