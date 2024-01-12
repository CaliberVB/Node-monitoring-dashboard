import CostTrack from "@/components/Dashboard/CostTrack";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Validator node monitoring",
  description: "This is the dashboard for monitoring Caliber's validator nodes",
  // other metadata
};

export default function Home() {
  return (
    <>
      <CostTrack />
    </>
  );
}
