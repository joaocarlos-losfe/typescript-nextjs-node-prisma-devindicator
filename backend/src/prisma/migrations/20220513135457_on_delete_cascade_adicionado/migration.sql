-- DropForeignKey
ALTER TABLE "messages" DROP CONSTRAINT "messages_email_id_fkey";

-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_user_id_fkey";

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messages" ADD CONSTRAINT "messages_email_id_fkey" FOREIGN KEY ("email_id") REFERENCES "user_contacts"("email") ON DELETE CASCADE ON UPDATE CASCADE;
