/*
  Warnings:

  - Added the required column `tiene` to the `Defenesas_en_reinos` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Defenesas_en_reinos" ADD COLUMN     "tiene" BOOLEAN NOT NULL;
