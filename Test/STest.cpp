// Copyright 1998-2016 Epic Games, Inc. All Rights Reserved.
#include "RedStone.h"
#include "STest.h"

/**
* Construct this widget
*
* @param	InArgs	The declaration data for this widget
*/
void STest::Construct(const FArguments& InArgs)
{
	SConstraintCanvas::Construct(SConstraintCanvas::FArguments());


	TestParam = InArgs._TestParam;

	AddSlot().Offset(FMargin(0,0,100,100))
		[
			SNew(SImage)
		];


}
