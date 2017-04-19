// Copyright 1998-2016 Epic Games, Inc. All Rights Reserved.
#pragma once
#include "GameFramework/PlayerController.h"
#include "RedStonePlayerController.generated.h"

UCLASS()
class ARedStonePlayerController : public APlayerController
{
	GENERATED_BODY()

public:
	ARedStonePlayerController();

	/**
	* Absolute coordinates could be either desktop or window space depending on what space the root of the widget hierarchy is in.
	*
	* @return true if the provided location in absolute coordinates is within the bounds of this geometry.
	*/
	UFUNCTION(BlueprintCallable,Category = "testtest")
		void TestCall();



protected:

	// Begin PlayerController interface
	virtual void PlayerTick(float DeltaTime) override;
	virtual void SetupInputComponent() override;
	// End PlayerController interface

	/** Resets HMD orientation in VR. */
	void OnResetVR();

};


