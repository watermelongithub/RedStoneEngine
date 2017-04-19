// Copyright 1998-2016 Epic Games, Inc. All Rights Reserved.

#include "RedStone.h"
#include "RedStonePlayerController.h"
#include "AI/Navigation/NavigationSystem.h"
#include "Runtime/Engine/Classes/Components/DecalComponent.h"
#include "Kismet/HeadMountedDisplayFunctionLibrary.h"
#include "RedStoneCharacter.h"

#include "SlateBasics.h"
#include "SPanel.h"
#include "STest.h"



ARedStonePlayerController::ARedStonePlayerController()
{
}

void ARedStonePlayerController::PlayerTick(float DeltaTime)
{
	Super::PlayerTick(DeltaTime);
}

void ARedStonePlayerController::SetupInputComponent()
{
	// set up gameplay key bindings
	Super::SetupInputComponent();

	InputComponent->BindAction("ResetVR", IE_Pressed, this, &ARedStonePlayerController::OnResetVR);
}

void ARedStonePlayerController::OnResetVR()
{
	UHeadMountedDisplayFunctionLibrary::ResetOrientationAndPosition();
}

void ARedStonePlayerController::TestCall()
{
	TSharedRef<STest> test = SNew(STest).TestParam("testtest");




	// If this is a game world add the widget to the current worlds viewport.
	UWorld* World = GetWorld();
	if (World && World->IsGameWorld())
	{
		UGameViewportClient* ViewportClient = World->GetGameViewport();
		if (ViewportClient)
		{
			{
				ViewportClient->AddViewportWidgetContent(test, 100);
			}
		}
	}

}