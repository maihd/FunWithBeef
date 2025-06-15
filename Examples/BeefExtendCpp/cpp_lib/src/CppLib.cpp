#include "CppLib.h"

#include <stdio.h>


Node::Node()
	: x(0)
	, y(0)
	, children({})
{
}


Node::~Node()
{
	printf("Node::~Node()\n");
}


void Node::Update(float dt)
{
	for (auto child : children)
	{
		child->Update(dt);
	}
}


void Node::Draw()
{
	for (auto child : children)
	{
		child->Draw();
	}
}


Sprite::Sprite()
	: Node()
	, image("")
{
}


Sprite::~Sprite()
{
	printf("Sprite::~Sprite()\n");
}


void Sprite::Update(float dt)
{
	Node::Update(dt);
}


void Sprite::Draw()
{
	printf("Sprite::Draw: %s\n", image.c_str());

	Node::Draw();
}

extern "C"
{
	Node* Node_Create(void)
	{
		return new Node();
	}


	void Node_Destroy(Node* node)
	{
		delete node;
	}


	Sprite* Sprite_Create(void)
	{
		return new Sprite();
	}


	void Sprite_Destroy(Sprite* sprite)
	{
		delete sprite;
	}


	// Virtual Methods


	void Node_Update(Node* sprite, float dt)
	{
		// Concrete call
		sprite->Node::Update(dt);
	}


	void Node_Draw(Node* sprite)
	{
		// Concrete call
		sprite->Node::Draw();
	}

	void Sprite_Update(Sprite* sprite, float dt)
	{
		// Concrete call
		sprite->Sprite::Update(dt);
	}


	void Sprite_Draw(Sprite* sprite)
	{
		// Concrete call
		sprite->Sprite::Draw();
	}
}


//! EOF
