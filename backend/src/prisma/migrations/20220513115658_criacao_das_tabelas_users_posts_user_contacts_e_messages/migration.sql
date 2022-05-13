-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "username" VARCHAR(10) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "pass" TEXT NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "posts" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "title" VARCHAR(50) NOT NULL,
    "description" VARCHAR(250) NOT NULL,
    "font_url" TEXT NOT NULL,
    "tags" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "posts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_contacts" (
    "email" TEXT NOT NULL,
    "full_name" TEXT NOT NULL,

    CONSTRAINT "user_contacts_pkey" PRIMARY KEY ("email")
);

-- CreateTable
CREATE TABLE "messages" (
    "id" TEXT NOT NULL,
    "contact_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "message" VARCHAR(50) NOT NULL,
    "answer" TEXT NOT NULL DEFAULT E'',
    "email_id" TEXT NOT NULL,

    CONSTRAINT "messages_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "posts_title_key" ON "posts"("title");

-- CreateIndex
CREATE UNIQUE INDEX "posts_description_key" ON "posts"("description");

-- CreateIndex
CREATE UNIQUE INDEX "posts_font_url_key" ON "posts"("font_url");

-- CreateIndex
CREATE UNIQUE INDEX "user_contacts_email_key" ON "user_contacts"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_contacts_full_name_key" ON "user_contacts"("full_name");

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_email_id_fkey" FOREIGN KEY ("email_id") REFERENCES "user_contacts"("email") ON DELETE RESTRICT ON UPDATE CASCADE;
