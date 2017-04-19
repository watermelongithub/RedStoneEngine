// Copyright 1998-2016 Epic Games, Inc. All Rights Reserved.

#pragma once

#include "SlateBasics.h"
#include "SConstraintCanvas.h"

/**
* Implements a widget that displays an image with a desired width and height.
*/
class STest	: public SConstraintCanvas
{
public:
	SLATE_BEGIN_ARGS(STest)
		: _TestParam("")
	{}
		/** Color and opacity */
		SLATE_ATTRIBUTE(FString, TestParam)

	SLATE_END_ARGS()


	/**
	* Construct this widget
	*
	* @param	InArgs	The declaration data for this widget
	*/
	void Construct(const FArguments& InArgs);


protected:

	/** The FName of the image resource to show */
	TAttribute< FString > TestParam;
};
